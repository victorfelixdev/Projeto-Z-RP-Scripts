window.addEventListener('message', function(event) {
  const data = event.data;
  const ammoDisplay = document.getElementById('ammoDisplay');
  const ammoText = document.getElementById('ammoText');

  if(data.action === "updateAmmo") {
    if (data.ammo || data.ammo == 0) {
      ammoDisplay.classList.remove('hidden');
      ammoText.innerText = data.ammo + " / " + (data.maxAmmo || 0);
    }
  } else if(data.action === "hide") {
    ammoDisplay.classList.add('hidden');
  }
});
