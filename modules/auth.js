// modules/auth.js
export class auth {
  constructor(params) {
    this.url = params.api_url;
    this.identity = params.key_identity;
    this.credential = params.key_credential;
  }

  headers() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Basic " + btoa(this.identity + ":" + this.credential)
    };
  }

  getUser(callback) {
    fetch(this.url + "/users", { headers: this.headers() })
      .then(r => r.json())
      .then(callback)
      .catch(err => console.error(err));
  }

  omk = {
    createItem: (data, callback) => {
      fetch(this.url + "/items", {
        method: "POST",
        headers: this.headers(),
        body: JSON.stringify(data)
      })
        .then(r => r.json())
        .then(callback)
        .catch(err => console.error(err));
    }
  }
}
