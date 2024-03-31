float random(float x) {
	return fract(sin(x * 12.9898 + 78.233) * 43758.5453);
}

float random2_1(vec2 uv) {
	return fract(sin(dot(uv.xy + vec2(sin(TIME), cos(TIME)),
			vec2(12.9898, 78.233))) * 43758.5453123);
}

float fresnel(float amount, vec3 normal, vec3 view) {
	return pow((1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0)), amount);
}