shader_type spatial;
render_mode blend_mix, depth_draw_always, cull_back, diffuse_burley, specular_schlick_ggx;

uniform vec4 albedo : source_color;
uniform vec4 emission_color : source_color;
uniform sampler3D texture_noise;
uniform float emission_strength : hint_range(0.0, 16.0) = 5.0;
uniform float rim_steepness : hint_range(0.0, 16.0) = 3.0;
uniform vec3 uv_scale;
uniform vec3 uv_offset;

void vertex() {
	UV = UV * uv_scale.xy + uv_offset.xy;
}

void fragment() {
	float theta = UV.y * 3.14159;
	float phi = UV.x * 3.14159 * 2.0;
	vec3 unit = vec3(0.0, 0.0, 0.0);

	unit.x = sin(phi) * sin(theta);
	unit.y = cos(theta) * -1.0;
	unit.z = cos(phi) * sin(theta);
	unit = normalize(unit);

	vec2 base_uv = UV;
	vec4 albedo_tex = texture(texture_noise, unit + uv_offset * TIME/2.0);
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	EMISSION = emission_color.rgb * albedo_tex.rgb * emission_strength;
	float NdotV = dot(NORMAL, VIEW);
	float rim_light = pow(1.0 - NdotV, rim_steepness);
	ALPHA = rim_light * emission_color.a / PI;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
