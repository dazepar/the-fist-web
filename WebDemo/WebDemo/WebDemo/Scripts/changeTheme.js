/*function changeTheme() {
    var element = document.body;
    element.classList.toggle("dark-mode");
}


aria-hidden="true"


const btn = document.querySelector('.btn-toggle');

// Lắng nghe sự kiện click vào button
btn.addEventListener('click', function () {
    // Thêm hoặc xóa class dark-theme ở body
    alert("oke")
    darkthemeAction('add');
})

const darkthemeAction = (action) => {
    if(action=='remove')
        document.body.classList.remove('dark-theme');

    if (action == 'add')
     document.body.classList.add('dark-theme');
}*/



const btn = document.querySelector('.btn-toggle');

const actionChange = (action) => {
    if (action == 'add') {
        document.body.classList.add("light-theme");
        document.body.classList.remove("dark-theme");
    }
    if (action == 'remove') {

        document.body.classList.remove("light-theme");
        document.body.classList.add('dark-theme');
    }
}

const testMode = () => {
    const state = localStorage.getItem('state');

    if (!state || state == 'add') actionChange("add")

    if (state == 'remove') actionChange('remove')
}


// Lắng nghe sự kiện click vào button 
btn.addEventListener('click', () => {
    // Thêm hoặc xóa class dark-theme ở body
    const state = document.body.className;
    if (state == 'light-theme') {
        //luu trang thai  add
        actionChange('remove')
        localStorage.setItem('state', 'remove');

    }
    if (state == 'dark-theme') {
        actionChange('add')
        localStorage.setItem('state', 'add');

    }
})

testMode()