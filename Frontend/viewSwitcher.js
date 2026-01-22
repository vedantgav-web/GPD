function switchTab(element, viewId) {
    // 1. Handle Button UI (Pill switching)
    const navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(item => item.classList.remove('active'));
    element.classList.add('active');

    // 2. Handle Content Visibility
    const views = document.querySelectorAll('.view-container');
    views.forEach(view => {
        view.classList.remove('active-view');
        view.style.display = 'none'; // Ensure it's hidden
    });

    const activeView = document.getElementById(viewId);
    activeView.classList.add('active-view');
    activeView.style.display = 'block'; // Show the selected view
}

// Optional: Ensure the first tab is visible on page load
document.addEventListener("DOMContentLoaded", () => {
    document.getElementById('viewDashboard').style.display = 'block';
});