    window.onload = function() {
        if (performance.navigation.type === 1) {
            // Page is reloaded, redirect to servlet page
            window.location.href = 'Homeservlet';
        }
    }
