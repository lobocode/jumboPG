function generateConf(formData) {
    return fetch('/generate-conf', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    }).then(response => response.text());
}

export { generateConf };
