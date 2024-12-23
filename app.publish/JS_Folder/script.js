document.addEventListener('DOMContentLoaded', function () {
    const currentPage = document.getElementById('current-page');
    // Get the current page name from the URL or another method
    const pageName = document.title;
    currentPage.textContent = pageName;
});

    //function updatePrices(button, multiplier) {
    //    var item = button.closest('.datalist-item'); // Find the closest DataList item
    //var baseDisPrice = parseFloat(item.querySelector('#hfBaseDisPrice').value);
    //var baseOrgPrice = parseFloat(item.querySelector('#hfBaseOrgPrice').value);

    //// Update prices
    //var newDisPrice = baseDisPrice * multiplier;
    //var newOrgPrice = baseOrgPrice * multiplier;

    //// Update labels
    //item.querySelector('#lblDisPrice').innerText = newDisPrice.toFixed(2);
    //item.querySelector('#lblOrgPrice').innerText = newOrgPrice.toFixed(2);

    //// Calculate and update discount amount
    //var discountAmount = baseOrgPrice - baseDisPrice;
    //var discountPercent = ((discountAmount / baseOrgPrice) * 100).toFixed(2);

    //item.querySelector('#lblDiscountAmount').innerText = "Saved Price: ₹" + discountAmount.toFixed(2);
    //item.querySelector('#discount_percent').innerText = "Discount: " + discountPercent + "%";

    //return false; // Prevent postback
    //}


$(document).ready(function () {
    adjustPercentLabelPosition();
});

function adjustPercentLabelPosition() {
    $('.product-item').each(function () {
        var priceContainer = $(this).find('.price-container');
        var percentLabel = $(this).find('.percent');

        // Calculate the width of price container
        var priceContainerWidth = priceContainer.outerWidth();

        // Set margin-left of percent label based on price container width
        percentLabel.css('margin-left', priceContainerWidth + 10); // Adjust as needed
    });
}


