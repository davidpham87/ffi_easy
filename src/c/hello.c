#include <stdio.h>
#include <stdlib.h>

typedef struct point {
  int x;
  int y;
} point_t;

void greeting() {
  printf("Hello, greeting!");
};

int greet() {
  printf("Hello, World!");
  return 0;
}

// simple test with simple types
int add(int x, int y) {
  return x+y;
}

// compose to simple type
int projection_x(point_t *a) {
  return a->x;
};

// composite to simple type
int sum_all(point_t *a, point_t *b) {
  return a->x + b->x + a->y + b->y;
};

// Notice that we passe pointers to the function
void plus(point_t *a, point_t *b, point_t *c) {
  c->x = a->x + b->x;
  c->y = a->y + b->y;
};

// Example of returning a point, see that we are still returning a pointer;
point_t *minus(point_t *a, point_t *b) {
  point_t* c = (point_t*) malloc(sizeof(point_t));
  c->x = a->x - b->x;
  c->y = a->y - b->y;
  return c;
};
