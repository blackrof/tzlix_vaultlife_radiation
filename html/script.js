window.addEventListener("message", (event) => {
  const data = event.data;

  if (data.action === "radiation") {
    document.getElementById("radiationLevel").style.width = `${data.value}%`;
  }

  if (data.action === "radiation_alert") {
    document.getElementById("radiationSound").play();
  }

  if (data.action === "show") {
    document.getElementById("radiationBar").style.display = "block";
  }
});
