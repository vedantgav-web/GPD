function showTab(tabName) {
  // Hide all tab content
  const tabs = document.querySelectorAll('.tab-content');
  tabs.forEach(tab => tab.classList.remove('active'));

  // Remove active class from all buttons
  const buttons = document.querySelectorAll('.tab-btn');
  buttons.forEach(btn => btn.classList.remove('active'));

  // Show selected tab and highlight its button
  document.getElementById(tabName + 'Tab').classList.add('active');
  const clickedBtn = Array.from(buttons).find(btn => btn.textContent.toLowerCase() === tabName);
  if (clickedBtn) clickedBtn.classList.add('active');
}
