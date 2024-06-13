let card = document.querySelectorAll(".kh-s-card-out");
let scrollTimeout;
card.forEach((element, index, array) => {
	element.style.transition = "0.8s ease-in-out";
	let cardIn = element.querySelector(".kh-send-card");
	if (index % 2 == 0) {
		cardIn.style.backgroundColor = "#FFF1E0";
	} else {
		cardIn.style.backgroundColor = "#FFE0E0";
	}
	element.addEventListener("mouseover", function(event) {
		element.style.cursor="default";
			mouseicn.classList.remove("kh-s-block");
			mouseicn.classList.add("kh-s-none");
			event.stopPropagation();
		});
});
const cardCon = document.querySelector(".kh-s-card-container");
const mouseicn = document.querySelector(".kh-s-mousemove");
//마우스 따라다니는 요소
cardCon.addEventListener("mouseover", function(event) {
	if (event.target === cardCon) {
		document.querySelector(".kh-s-mousemove > img").src =
			"finance/img/dragbtn.png";
	}
	cardCon.style.cursor="none";
	mouseicn.classList.remove("kh-s-none");
	mouseicn.classList.add("kh-s-block");
	event.stopPropagation();
});

document.addEventListener("mousemove", (event) => {
	const mouseX = event.clientX;
	const mouseY = event.clientY;
	mouseicn.style.pointerEvents = "none";
	mouseicn.style.left = mouseX + "px";
	mouseicn.style.top = mouseY + "px";
});

cardCon.addEventListener("mouseout", function() {
	mouseicn.classList.remove("kh-s-block");
	mouseicn.classList.add("kh-s-none");
});

cardCon.addEventListener("wheel", function(event) {
	card.forEach((element) => {
		// Prevent the default vertical scroll
		event.preventDefault();
		// Scroll horizontally
		const scrollSpeed = 0.5;
		this.scrollLeft += event.deltaY * scrollSpeed;
		if (scrollTimeout) {
			element.style.transform = "rotateY(30deg)";
			clearTimeout(scrollTimeout);
		}
		// Set a timeout to remove the vibration class after 1 second
		scrollTimeout = setTimeout(() => {
			card.forEach(function(element) {
				element.style.transform = "rotateY(0deg)";
			});
			isRotated = false;
		}, 300); // 1초 동안 유지
	});
});
let isDown = false;
let startX;
let scrollLeft;

cardCon.addEventListener("mousedown", (e) => {
	isDown = true;
	cardCon.classList.add("active");
	startX = e.pageX - cardCon.offsetLeft;
	scrollLeft = cardCon.scrollLeft;
});

cardCon.addEventListener("mouseleave", () => {
	isDown = false;
	cardCon.classList.remove("active");
});

cardCon.addEventListener("mouseup", () => {
	isDown = false;
	cardCon.classList.remove("active");
});

cardCon.addEventListener("mousemove", (e) => {
	if (!isDown) return;
	e.preventDefault();
	const x = e.pageX - cardCon.offsetLeft;
	const walk = (x - startX) * 2; //scroll-fast
	cardCon.scrollLeft = scrollLeft - walk;
});
cardCon.addEventListener("touchstart", (e) => {
	isDown = true;
	startX = e.touches[0].pageX - cardCon.offsetLeft;
	scrollLeft = cardCon.scrollLeft;
});

cardCon.addEventListener("touchend", () => {
	isDown = false;
});

cardCon.addEventListener("touchmove", (e) => {
	if (!isDown) return;
	const x = e.touches[0].pageX - cardCon.offsetLeft;
	const walk = (x - startX) * 2; //scroll-fast
	cardCon.scrollLeft = scrollLeft - walk;
});