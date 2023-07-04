// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function() {
  const loginSubmitButton = document.getElementById("login-submit");
  const loginForm = document.getElementById("login-form");
  if (loginSubmitButton && loginForm) {
    loginSubmitButton.addEventListener("click", () => { loginForm.submit(); });
  }

  const signupSubmitButton = document.getElementById("signup-submit");
  const signupForm = document.getElementById("signup-form");
  if (signupSubmitButton && signupForm) {
    signupSubmitButton.addEventListener("click", () => { signupForm.submit(); });
  }
});