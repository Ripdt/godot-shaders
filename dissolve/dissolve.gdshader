shader_type spatial;

render_mode cull_disabled; // objeto oco

varying vec3 world_pos;

void vertex() {
    vec4 world_position = MODEL_MATRIX * vec4(VERTEX, 1.0);
    world_pos = world_position.xyz;
}

uniform vec3 rgb : source_color;
uniform float dissolve_height : hint_range(-1.0, 1.0, 0.01);

void fragment() {
	ALBEDO = rgb;
	ALPHA = 1.0 - step(dissolve_height, world_pos.g);
	ALPHA_SCISSOR_THRESHOLD = .5;
}