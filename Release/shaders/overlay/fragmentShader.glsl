#version 330 core

// FOCUS OVERLAY FRAGMENT SHADER
// WIP

in vec2 uv;
out vec4 color;

uniform float Time;
uniform vec2 OverlaySize;

void main() {
    float size = sin(4.0 * Time) * 0.05 + 0.95;
    float width = 0.005 / OverlaySize.x;

    float b = 0.0;

    if (min(min(uv.x - (1.0 - size), uv.y - (1.0 - size)), min(size - uv.x, size - uv.y)) < width
        && min(min(uv.x - (1.0 - (size + width)), uv.y - (1.0 - (size + width))), min((size + width) - uv.x, (size + width) - uv.y)) > width
        && abs(uv.x - 0.5) > 0.25 * (size * 2.0 - 1.0) && abs(uv.y - 0.5) > 0.25 * (size * 2.0 - 1.0)) b = 1.0;

    color = vec4(b);
}