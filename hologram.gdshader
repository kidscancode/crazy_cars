shader_type spatial;
render_mode unshaded, shadows_disabled;
#include "funcs.gdshaderinc"

uniform float lines1:hint_range(0.0, 200.0, 1.0) = 2.0;
uniform float lines2:hint_range(0.0, 100.0, 1.0) = 2.0;
uniform vec3 color: source_color;
uniform float _emission:hint_range(0.0, 10.0) = 1.0;
uniform float _fresnel:hint_range(0.0, 10.0) = 1.0;

varying float rand_dist;

void vertex() {
	float distortion = sin(TIME * 10.0 + VERTEX.y * 20.0) * 0.04;
	float rand_time = random(TIME);
	rand_dist = step(rand_time, 0.05);
	
	VERTEX.x += distortion * rand_dist;
}

void fragment() {
	float n = random2_1(SCREEN_UV);
	float f = fresnel(_fresnel, NORMAL, VIEW);
	
	vec2 igrid = floor(SCREEN_UV * lines1);
	float l1 = mod(igrid.y, 2.0);
	l1 = mix(0.4, 1.0, l1);
	
	vec2 uv2 = SCREEN_UV;
	uv2.y -= TIME * 0.06;
	vec2 igrid2 = floor(uv2 * lines2);
	float l2 = random(igrid2.y);
	l2 = step(0.2, l2);
	l2 = mix(0.2, 1.0, l2);
	
	float m = f * n * l1;// * l2;
	ALPHA = m;
	ALBEDO = color * mix(_emission, _emission + 5.0, rand_dist);
}
