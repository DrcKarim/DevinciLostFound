export default class SimpleRecorder {
    constructor() {
        this.mediaRecorder = null;
        this.chunks = [];
        this.stream = null;
    }

    async start() {
        this.chunks = [];
        if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
            throw new Error('getUserMedia not supported');
        }
        this.stream = await navigator.mediaDevices.getUserMedia({ audio: true });
        try {
            this.mediaRecorder = new MediaRecorder(this.stream);
        } catch (e) {
            // Some browsers may require a specific mimeType
            this.mediaRecorder = new MediaRecorder(this.stream, { mimeType: 'audio/webm' });
        }
        this.mediaRecorder.ondataavailable = (ev) => {
            if (ev.data && ev.data.size > 0) this.chunks.push(ev.data);
        };
        this.mediaRecorder.start();
    }

    async stop() {
        if (!this.mediaRecorder) return null;
        return new Promise((resolve) => {
            this.mediaRecorder.onstop = () => {
                const blob = new Blob(this.chunks, { type: 'audio/webm' });
                // stop all tracks
                if (this.stream) {
                    this.stream.getTracks().forEach((t) => t.stop());
                }
                resolve(blob);
            };
            this.mediaRecorder.stop();
        });
    }
}
