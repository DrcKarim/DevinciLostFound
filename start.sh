#!/bin/bash

echo "🚀 Starting DevInci Lost & Found..."
echo ""

# Check if Ollama is running
if ! curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
    echo "❌ Ollama is not running!"
    echo "Please start Ollama first: ollama serve"
    exit 1
fi

echo "✅ Ollama is running"

# Check if llama2 model is installed
if ! curl -s http://localhost:11434/api/tags | grep -q "llama2"; then
    echo "⚠️  llama2 model not found. Installing..."
    ollama pull llama2
fi

echo "✅ llama2 model available"

# Check if Omeka-S is accessible
if ! curl -s http://localhost/omk_thyp_25-26_clone > /dev/null 2>&1; then
    echo "❌ Omeka-S is not accessible at http://localhost/omk_thyp_25-26_clone"
    echo "Please start your Apache/XAMPP/MAMP server"
    exit 1
fi

echo "✅ Omeka-S is accessible"

# Get the base directory (DevinciLostFound)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Start search API server (from module)
echo ""
echo "🔍 Starting Search API server on port 8083..."
cd "$SCRIPT_DIR/../omk_thyp_25-26_clone/modules/DescriptionWithAI"
php -S localhost:8083 api.php > /tmp/search-api.log 2>&1 &
SEARCH_API_PID=$!
echo "   Search API: http://localhost:8083"

# Start frontend server
cd "$SCRIPT_DIR"
echo ""
echo "🌐 Starting frontend server on port 8085..."
echo "   Frontend: http://localhost:8085/apiOmk.html"
echo ""
echo "Press Ctrl+C to stop all servers"
echo ""

# Cleanup function
cleanup() {
    echo ""
    echo "Stopping servers..."
    kill $SEARCH_API_PID 2>/dev/null
    exit 0
}

trap cleanup INT TERM

python3 -m http.server 8085
