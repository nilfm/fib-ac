#include <stdio.h>

int a = 2;
int b = 3;

int main() {
	int i;
	for (i = 0; i < 300; i++) {
		if (a == b) {
			b = b + (b-a)/2;
	}
}
