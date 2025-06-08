shader_type spatial;

uniform sampler2D uv_offset_texture : hint_default_black;
uniform vec2 uv_offset_scale = vec2(-0.05, -0.00);
uniform vec2 time_scale = vec2(0.05, 0.0);
uniform float face_distortion = 0.5;

void vertex() {
	
	vec2 base_uv_offset = UV * uv_offset_scale;
	base_uv_offset += TIME * time_scale;
	
	float noise = texture(uv_offset_texture, base_uv_offset).r;
	noise = smoothstep(0.0, 1.0, noise);
	float texture_based_offset = noise * 2.0 - 1.0;
	texture_based_offset *= UV.x;
	
	VERTEX.y += texture_based_offset;
	VERTEX.z += texture_based_offset * face_distortion;
	
}

uniform sampler2D flag_texture;
uniform vec3 base_color = vec3(1.0, 0.3, 0.3);
uniform float roughness = 0.5;

void fragment() {
	
	vec3 tex_color = texture(flag_texture, UV).rgb;
	
    ALBEDO = tex_color * base_color;
	
	ROUGHNESS = roughness;
	
	
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}