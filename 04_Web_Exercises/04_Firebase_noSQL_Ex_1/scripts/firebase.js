import { initializeApp } from "https://www.gstatic.com/firebasejs/12.0.0/firebase-app.js";
import { getFirestore } from "https://www.gstatic.com/firebasejs/12.0.0/firebase-firestore.js";

// Podes deixar assim para subir para o GitHub de forma segura:
const firebaseConfig = {
    apiKey: "SUBSTITUI_PELA_TUA_API_KEY",
    authDomain: "uc610-4a34b.firebaseapp.com",
    projectId: "uc610-4a34b",
    storageBucket: "uc610-4a34b.firebasestorage.app",
    messagingSenderId: "596983725072",
    appId: "1:596983725072:web:871ddb66632db41a259e95"
};

let db = null;

const isConfigured = firebaseConfig.apiKey &&
    firebaseConfig.apiKey !== "" &&
    !firebaseConfig.apiKey.includes("SUBSTITUI");

if (isConfigured) {
    try {
        const app = initializeApp(firebaseConfig);
        db = getFirestore(app);
        console.log("Ligação ao Firebase efetuada com sucesso!");
    } catch (error) {
        console.error("Erro ao inicializar o Firebase. A usar fallback de LocalStorage.", error);
    }
} else {
    console.warn("Firebase não configurado. A usar o LocalStorage como alternativa de segurança.");
}

export { db };