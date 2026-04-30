function initializeSVGControls(svgElement, svgContainer, resetButton, rotateButton) {
    let scale = 1;
    let translateX = 0, translateY = 0;
    let rotateDeg = 0;
    let startX, startY, isDragging = false;
    const zoomSpeed = 0.1;

    // touch variables
    let startDistance = 0;
    let isPinching = false;
    let isTouchDragging = false;
    let lastTouchX = 0;
    let lastTouchY = 0;

    function applyTransform() {
        svgElement.style.transform = `translate(${translateX}px, ${translateY}px) scale(${scale}) rotate(${rotateDeg}deg)`;
    }

    if (rotateButton) {
        rotateButton.addEventListener('click', function(e) {
            e.stopPropagation();
            rotateDeg = (rotateDeg + 90) % 360;
            const icon = this.querySelector('.rotate-icon');
            if (icon) {
                icon.style.transform = `rotate(${rotateDeg}deg)`;
            }
            applyTransform();
        });
    }

    // Wheel zoom
    svgElement.addEventListener('wheel', function (e) {
        e.preventDefault();
        const oldScale = scale;
        scale += (e.deltaY < 0 ? zoomSpeed : -zoomSpeed);
        scale = Math.max(1, Math.min(scale, 5));

        const containerRect = svgContainer.getBoundingClientRect();
        const centerX = e.clientX - containerRect.left;
        const centerY = e.clientY - containerRect.top;

        const deltaX = (centerX - translateX) * (1 - oldScale / scale);
        const deltaY = (centerY - translateY) * (1 - oldScale / scale);

        translateX -= deltaX;
        translateY -= deltaY;

        applyTransform();
    });

    // Mouse drag
    svgElement.addEventListener('mousedown', function (e) {
        e.preventDefault();
        isDragging = true;
        startX = e.clientX - translateX;
        startY = e.clientY - translateY;
        svgElement.style.cursor = 'grabbing';
    });

    window.addEventListener('mousemove', function (e) {
        if (isDragging) {
            translateX = e.clientX - startX;
            translateY = e.clientY - startY;
            applyTransform();
        }
    });

    window.addEventListener('mouseup', function () {
        isDragging = false;
        svgElement.style.cursor = 'grab';
    });

    // Reset button
    if (resetButton) {
        resetButton.addEventListener('click', function (e) {
            e.stopPropagation();
            scale = 1;
            translateX = 0;
            translateY = 0;
            rotateDeg = 0;
            const icon = svgContainer.querySelector('.rotate-icon');
            if (icon) icon.style.transform = 'rotate(0deg)';
            
            svgElement.style.transition = 'transform 0.3s ease';
            applyTransform();
            setTimeout(() => svgElement.style.transition = 'transform 0.1s ease-out', 350);
        });
    }

    // Touch events for Pinch-Zoom & Pan
    function getDistance(touches) {
        const dx = touches[0].clientX - touches[1].clientX;
        const dy = touches[0].clientY - touches[1].clientY;
        return Math.sqrt(dx * dx + dy * dy);
    }

    svgContainer.addEventListener('touchstart', function(e) {
        if (e.touches.length === 2) {
            isPinching = true;
            startDistance = getDistance(e.touches);
        } else if (e.touches.length === 1 && scale > 1) {
            isTouchDragging = true;
            lastTouchX = e.touches[0].clientX;
            lastTouchY = e.touches[0].clientY;
        }
    }, { passive: false });

    svgContainer.addEventListener('touchmove', function(e) {
        if (isPinching && e.touches.length === 2) {
            e.preventDefault();
            const newDistance = getDistance(e.touches);
            const zoomFactor = newDistance / startDistance;

            let newScale = scale * zoomFactor;
            newScale = Math.max(0.5, Math.min(newScale, 5));

            scale = newScale;
            startDistance = newDistance;

            applyTransform();
        } else if (isTouchDragging && e.touches.length === 1) {
            e.preventDefault();
            const touch = e.touches[0];
            const dx = touch.clientX - lastTouchX;
            const dy = touch.clientY - lastTouchY;

            translateX += dx;
            translateY += dy;

            lastTouchX = touch.clientX;
            lastTouchY = touch.clientY;

            applyTransform();
        }
    }, { passive: false });

    svgContainer.addEventListener('touchend', function() {
        isPinching = false;
        isTouchDragging = false;
    });
}

document.querySelectorAll('.svg-container').forEach(container => {
    const svgElement = container.querySelector('svg');
    const resetButton = container.querySelector('.reset-button');
    const rotateButton = container.querySelector('.rotate-button');
    if (svgElement) {
        initializeSVGControls(svgElement, container, resetButton, rotateButton);
    }
});
