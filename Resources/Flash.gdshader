shader_type canvas_item;

uniform vec3 color_rgb = vec3(0.0, 0.0, 0.0);

void fragment() {
	COLOR = texture(TEXTURE, UV);
	COLOR.rgb += color_rgb;
}
