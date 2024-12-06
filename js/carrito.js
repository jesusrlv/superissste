document.addEventListener("DOMContentLoaded", () => {
    const cartBody = document.getElementById("cartBody");
    const sendCart = document.getElementById("sendCart");

    // Ejemplo de productos
    const products = [
        { id: 1, name: "Producto A", price: 100 },
        { id: 2, name: "Producto B", price: 200 },
        { id: 3, name: "Producto C", price: 150 },
    ];

    // Agregar productos al grid
    products.forEach(product => {
        const row = document.createElement("tr");
        row.dataset.productId = product.id;

        row.innerHTML = `
            <td>${product.name}</td>
            <td><input type="number" value="1" min="1" class="w-50 quantity"></td>
            <td>${product.price}</td>
            <td class="total">${product.price}</td>
            <td><button type="button" class="btn btn-danger btn-sm btn-lg remove"><i class="bi bi-trash3-fill small"></i></button></td>
        `;

        cartBody.appendChild(row);
    });

    // Actualizar el total cuando cambia la cantidad
    cartBody.addEventListener("input", (e) => {
        if (e.target.classList.contains("quantity")) {
            const row = e.target.closest("tr");
            const price = parseFloat(row.children[2].textContent);
            const quantity = parseInt(e.target.value);
            const totalCell = row.querySelector(".total");

            totalCell.textContent = (price * quantity).toFixed(2);
        }
    });

    // Eliminar un producto del carrito
    cartBody.addEventListener("click", (e) => {
        if (e.target.classList.contains("remove")) {
            e.target.closest("tr").remove();
        }
    });

    // Enviar carrito por AJAX
    sendCart.addEventListener("click", () => {
        const cartData = [];

        document.querySelectorAll("#cartBody tr").forEach(row => {
            const productId = row.dataset.productId;
            const quantity = row.querySelector(".quantity").value;
            const total = row.querySelector(".total").textContent;

            cartData.push({
                productId,
                quantity,
                total
            });
        });

        // Enviar al servidor
        fetch("save_cart.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(cartData)
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message || "Carrito enviado con éxito");
        })
        .catch(error => {
            console.error("Error:", error);
        });
    });
});
