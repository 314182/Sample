


#include "main.h"
#include <gtest/gtest.h>
TEST(test_add,positive_nos)
{
ASSERT_EQ(10,add(6,4));
ASSERT_EQ(1073741824 ,add(536870912,536870912));
}
TEST(test_add,negative_nos)
{
ASSERT_EQ(2,add(6,-4));
ASSERT_EQ(0 ,add(536870912,-536870912));
}
TEST(test_subt,positive_nos)
{
ASSERT_EQ(-10,subt(20,30));
ASSERT_EQ(0,subt(536870912,536870912));
}
/*TEST(test_subt,negative_nos)
{
ASSERT_EQ(-20,subt(-10,10));
ASSERT_EQ(1073741824,subt(536870912,-536870912));
}*/
TEST(test_mult,positive_nos)
{
ASSERT_EQ(600,mult(20,30));
ASSERT_EQ(161863255,mult(8765,18467));
}
/*TEST(test_mult,negative_nos)
{
ASSERT_EQ(-100,mult(-10,10));
ASSERT_EQ(-161863255,mult(-8765,18467));
}*/
TEST(test_divi,positive_nos)
{
ASSERT_EQ(3.0,divi(30,10));
ASSERT_EQ(98400.0,divi(536870912,5456));
}
/*TEST(test_divi,negative_nos)
{
ASSERT_EQ(-10,divi(-100,10));
ASSERT_EQ(-98400.09384164,divi(-536870912,5456));
}
*/
int main(int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}


