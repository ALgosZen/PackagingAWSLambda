//accepts event object 

exports.handler = async (event) => {
    console.log('Event: ', event);
    let responseMessage = 'Hello, Vito Carleone!';
// with payload 
    if (event.queryStringParameters && event.queryStringParameters['Name']) {
        responseMessage = 'Hello, ' + event.queryStringParameters['Name'] + '!';
    }
// with post method 
    if (event.httpMethod === 'POST') {
        const body = JSON.parse(event.body);
        responseMessage = 'Hello, ' + body.name + '!';
    }
// return response to the function caller 
    const response = {
        statusCode: 200,
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            message: responseMessage
        }),
    };

    return response;
};
