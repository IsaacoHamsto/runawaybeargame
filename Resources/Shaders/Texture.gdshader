shader_type canvas_item;

uniform vec4 color_rgba = vec4(0.0, 0.0, 0.0, 0.0);

void fragment() {
	COLOR = texture(TEXTURE, UV);
	COLOR.rgba += color_rgba;
}
