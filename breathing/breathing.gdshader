shader_type spatial;
		
uniform float roughness : hint_range(0.0, 1.0);
uniform float metallic : hint_range(0.0, 1.0) = 0.0;
uniform vec3 albedo : source_color;

uniform float vertex_offset_intensity = 0.1;

void vertex() {
	float breathing = sin(TIME * 2.0) * 0.5 + 0.5;
	float dynamic_intensity = vertex_offset_intensity * breathing;
	VERTEX += NORMAL * dynamic_intensity;
}

void fragment() {
	ALBEDO = albedo;
	ROUGHNESS = roughness;
	METALLIC = metallic;
}
