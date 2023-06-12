shader_type canvas_item;

uniform vec4 color_rgba = vec4(0.0, 0.0, 0.0, 0.0);

void fragment() {
	
	COLOR.rgba += color_rgba;
}
