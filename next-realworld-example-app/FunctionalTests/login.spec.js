
//const appUrl = 'https://next-realworld.vercel.app/';
const appUrl = 'http://localhost:3000/';

describe('Test Sign up and Sign In Flow', ()=>{
    it('user should be able to successfully sign up and then log in back again', ()=>{

        cy.log('Navigate to the application');
        cy.visit(appUrl);
        cy.get('a.nav-link[href="/user/register"]').click();
        cy.get('h1').should('have.text', 'Sign Up');

        cy.log('Enter username, email and password fields and click submit');

        var username = `testuser${Date.now()}`;
        
        cy.get('input[placeholder="Username"]').type(username);
        cy.get('input[type="email"]').type(`${username}@test.com`);
        cy.get('input[type="password"]').type(`testuser123`);
        cy.get('button[type="submit"]').click();

        cy.log('User should be able to sign up successfully')
        cy.get(`a[href="/profile/${username}"]`).should('have.text', username);
        cy.log('User is logged in');

        cy.get('a[href="/user/settings"]').click();
        cy.get('.btn-outline-danger').click();
        console.log('current url ' + cy.url())
        cy.url().should('eq', appUrl);
        cy.log('User can successfully log out');

        cy.log('Logging in back into the system by the same user');
        cy.get('a.nav-link[href="/user/login"]').click();
        cy.get('h1').should('have.text', 'Sign in');

        cy.get('input[type="email"]').type(`${username}@test.com`);
        cy.get('input[type="password"]').type(`testuser123`);
        cy.get('button[type="submit"]').click();

        cy.log('User should be able to sign up successfully')
        cy.get(`a[href="/profile/${username}"]`).should('have.text', username);
        cy.log('User is logged in again');

    })
})
