document.addEventListener("DOMContentLoaded", () => {
    const cartBody = document.getElementById("cartBody");
    const sendCart = document.getElementById("sendCart");
    const totalDisplay = document.getElementById("total");
    let products = [];

    window.carritoStore = (id, detalle, precio) => {
        const offcanvasElement = document.getElementById('carrito');
        const bsOffcanvas = new bootstrap.Offcanvas(offcanvasElement);
        bsOffcanvas.show();
        tablaGrid(id, detalle, precio);
    };

    const tablaGrid = (id1, detalle, precio) => {
        products.push({ id: id1, name: detalle, price: precio });
        const row = document.createElement("tr");
        row.dataset.productId = id1;

        row.innerHTML = `
            <td class="fw-bold small">${detalle}</td>
            <td><input type="number" value="1" min="1" class="form-control quantity text-center"></td>
            <td class="text-center small">${precio.toFixed(2)}</td>
            <td class="text-center small total">${precio.toFixed(2)}</td>
            <td><button class="btn btn-danger btn-sm remove"><i class="bi bi-trash"></i></button></td>
        `;

        cartBody.appendChild(row);
        calculateTotal();
    };

    const calculateTotal = () => {
        const totals = [...cartBody.querySelectorAll(".total")].map(cell => parseFloat(cell.textContent) || 0);
        const total = totals.reduce((sum, value) => sum + value, 0);
        totalDisplay.textContent = `${total.toFixed(2)}`;
        sendCart.disabled = total === 0;
    };

    cartBody.addEventListener("input", (e) => {
        if (e.target.classList.contains("quantity")) {
            const row = e.target.closest("tr");
            const price = parseFloat(row.children[2].textContent) || 0;
            const quantity = parseInt(e.target.value) || 0;
            const totalCell = row.querySelector(".total");

            totalCell.textContent = (price * quantity).toFixed(2);
            calculateTotal();
        }
    });

    cartBody.addEventListener("click", (e) => {
        const removeButton = e.target.closest(".remove");
        if (removeButton) {
            removeButton.closest("tr").remove();
            calculateTotal();
        }
    });

    sendCart.addEventListener("click", () => {
        const cartData = [...cartBody.querySelectorAll("tr")].map(row => ({
            productId: row.dataset.productId,
            quantity: row.querySelector(".quantity").value,
            total: row.querySelector(".total").textContent
        }));

        fetch("save_cart.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(cartData)
        })
        .then(response => response.json())
        .then(data => alert(data.message || "Carrito enviado con éxito"))
        .catch(error => console.error("Error:", error));
    });
});
