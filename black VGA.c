int main(){

	clear_screen();

}


void clear_screen() {
	
	 int x, y;
	 for (x = 0; x < 320; x++) {
		 for (y = 0; y < 240; y++) {
		 	write_pixel(x,y,0);
 		}
 	}
 }


void write_pixel(int x, int y, short colour) {
	 volatile short *vga_addr=(volatile short*)(0xC8000000 + (y<<10) + (x<<1));
	 *vga_addr=colour;
 }
