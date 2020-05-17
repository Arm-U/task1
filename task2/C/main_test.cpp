#include "main_test.h"

TEST(CHECK, foo1) {
	ASSERT_EQ(1, foo1());
}

TEST(CHECK, foo2) {
	ASSERT_EQ(1, foo2());
}
