export const siggnup = user =>(
    $.ajax({
        url: '/api/users',
        method: 'POST',
        data: { user }

    })
);

export const loggin = user => (
    $.ajax({
        url: '/api/session',
        method: 'POST',
        data: { user }

    })
);

export const loggout = () => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE',

    })
);