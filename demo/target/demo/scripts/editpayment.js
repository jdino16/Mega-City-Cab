document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('form');

    form.addEventListener('submit', (e) => {
        const amountInput = document.querySelector('input[name="amount"]');
        if (isNaN(amountInput.value) || parseFloat(amountInput.value) <= 0) {
            alert('Please enter a valid amount!');
            amountInput.focus();
            e.preventDefault();
        }
    });
});
