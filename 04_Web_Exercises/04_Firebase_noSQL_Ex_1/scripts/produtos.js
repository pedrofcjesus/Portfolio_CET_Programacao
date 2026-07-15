import { db } from "./firebase.js";

import {
    collection,
    addDoc,
    deleteDoc,
    updateDoc,
    doc,
    getDocs
} from "https://www.gstatic.com/firebasejs/12.0.0/firebase-firestore.js";

let idEditar = null;

export async function guardarProduto() {
    let nome = document.getElementById("nome").value;
    let preco = Number(document.getElementById("preco").value);
    let quantidade = Number(document.getElementById("quantidade").value);

    if (!nome || isNaN(preco) || isNaN(quantidade)) {
        alert("Por favor, preencha todos os campos corretamente.");
        return;
    }

    try {
        if (db) {
            if (idEditar == null) {
                await addDoc(collection(db, "Produtos"), { nome, preco, quantidade });
                alert("Produto Guardado com Sucesso no Firebase!");
            } else {
                await updateDoc(doc(db, "Produtos", idEditar), { nome, preco, quantidade });
                alert("Produto atualizado com sucesso no Firebase!");
            }
        } else {
            let produtosLocais = JSON.parse(localStorage.getItem("produtos_local")) || [];

            if (idEditar == null) {
                let novoProduto = {
                    id: Date.now().toString(),
                    nome: nome,
                    preco: preco,
                    quantidade: quantidade
                };
                produtosLocais.push(novoProduto);
                alert("Produto Guardado localmente com sucesso!");
            } else {
                produtosLocais = produtosLocais.map(p => {
                    if (p.id === idEditar) {
                        return { id: idEditar, nome, preco, quantidade };
                    }
                    return p;
                });
                alert("Produto atualizado localmente com sucesso!");
            }
            localStorage.setItem("produtos_local", JSON.stringify(produtosLocais));
        }

        idEditar = null;
        document.getElementById("guardar").innerHTML = "Guardar";
        limparCampos();
        listarProdutos();

    } catch (error) {
        console.error("Erro ao guardar o produto:", error);
    }
}

export async function listarProdutos() {
    let tabela = document.getElementById("tabela");
    tabela.innerHTML = "";

    let listaProdutos = [];

    try {
        if (db) {
            const resultado = await getDocs(collection(db, "Produtos"));
            resultado.forEach((documento) => {
                listaProdutos.push({
                    id: documento.id,
                    ...documento.data()
                });
            });
        } else {
            listaProdutos = JSON.parse(localStorage.getItem("produtos_local")) || [];
        }

        listaProdutos.forEach((produto) => {
            tabela.innerHTML += `
                <tr>
                    <td>${produto.nome}</td>
                    <td>${produto.preco}</td>
                    <td>${produto.quantidade}</td>
                    <td>
                        <button onclick="editarProduto('${produto.id}','${produto.nome}',${produto.preco},${produto.quantidade})">
                            Editar
                        </button>
                    </td>
                    <td>
                        <button onclick="apagarProduto('${produto.id}')">
                            Apagar
                        </button>
                    </td>
                </tr>
            `;
        });

    } catch (error) {
        console.error("Erro ao listar os produtos:", error);
    }
}

window.editarProduto = function (id, nome, preco, quantity) {
    idEditar = id;

    document.getElementById("nome").value = nome;
    document.getElementById("preco").value = preco;
    document.getElementById("quantidade").value = quantity;
    document.getElementById("guardar").innerHTML = "Atualizar";
};

window.apagarProduto = async function (id) {
    if (confirm("Pretende apagar este produto?")) {
        try {
            if (db) {
                await deleteDoc(doc(db, "Produtos", id));
            } else {
                let produtosLocais = JSON.parse(localStorage.getItem("produtos_local")) || [];
                produtosLocais = produtosLocais.filter(p => p.id !== id);
                localStorage.setItem("produtos_local", JSON.stringify(produtosLocais));
            }
            listarProdutos();
        } catch (error) {
            console.error("Erro ao apagar o produto:", error);
        }
    }
};

function limparCampos() {
    document.getElementById("nome").value = "";
    document.getElementById("preco").value = "";
    document.getElementById("quantidade").value = "";
}

listarProdutos();

document
    .getElementById("guardar")
    .addEventListener("click", guardarProduto);