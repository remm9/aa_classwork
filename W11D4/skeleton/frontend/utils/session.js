export const postUser = user => {
    // debugger
    return $.ajax({
        method: 'post',
        url: '/api/users',
        data: { user }
    })
};

export const postSession = user => {
    return $.ajax({
        method: 'post',
        url: '/api/session',
        data: { user }
    })
};

export const deleteSession = user => {
    return $.ajax({
        method: 'delete',
        url: '/api/session',
    })
};