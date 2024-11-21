document.addEventListener('DOMContentLoaded', function() {
    // Fetch and populate regions
    fetch('http://localhost:5000/api/regions')
        .then(response => response.json())
        .then(data => {
            const regionSelect = document.getElementById('region');
            data.forEach(region => {
                const option = document.createElement('option');
                option.value = region.id;
                option.text = region.name;
                regionSelect.add(option);
            });
        });

    // Fetch and populate goals
    fetch('http://localhost:5000/api/goals')
        .then(response => response.json())
        .then(data => {
            const goalSelect = document.getElementById('goal');
            data.forEach(goal => {
                const option = document.createElement('option');
                option.value = goal.id;
                option.text = goal.name;
                goalSelect.add(option);
            });
        });

    // Handle user registration
    document.getElementById('register-form').addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = {
            name: document.getElementById('name').value,
            region_id: document.getElementById('region').value,
            goal_id: document.getElementById('goal').value,
            age: document.getElementById('age').value,
            height: document.getElementById('height').value,
            weight: document.getElementById('weight').value,
            gender: document.querySelector('input[name="gender"]:checked').value
        };

    });
    
});
