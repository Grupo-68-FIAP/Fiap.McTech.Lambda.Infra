const https = require('https');

exports.handler = async (event) => {
    const { userName, request } = event;
    const { email, custom: { cpf } } = request.userAttributes; 

    const data = JSON.stringify({
        name: userName,   
        cpf: cpf,         
        email: email
    });

    const options = {
        hostname: process.env.API_GATEWAY_APPLICATION_PROXY,
        path: '/cliente',          
        method: 'POST',             
        headers: {
            'Content-Type': 'application/json',
            'Content-Length': data.length
        }
    };

    const req = https.request(options, (res) => {
        let response = '';
        
        res.on('data', (chunk) => {
            response += chunk;
        });

        res.on('end', () => {
            console.log('Resposta da API: ', response);
        });
    });

    req.on('error', (e) => {
        console.error(`Erro na chamada à API: ${e.message}`);
    });

    req.write(data);
    req.end();

    return {
        statusCode: 200,
        body: JSON.stringify('API de cadastro chamada com sucesso!'),
    };
};