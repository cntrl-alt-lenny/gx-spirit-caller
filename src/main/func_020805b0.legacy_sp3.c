typedef unsigned int u32;

int func_020805b0(u32 x, u32 y)
{
    u32 tx = x >> 3;
    u32 ty = y >> 3;
    u32 xb = x & 4;
    u32 xa;
    u32 xc = xb >> 2;
    u32 yb = y & 4;
    u32 ya;
    u32 yc = yb >> 2;
    u32 r = 0;
    xa = ((x & 2) >> 1) + (x & 1);
    ya = ((y & 2) >> 1) + (y & 1);
    r += tx * ty;
    r += ty * (xc + xa * 2);
    r += tx * (yc + ya * 2);
    r += (xa + xc) * (ya + yc);
    return r;
}