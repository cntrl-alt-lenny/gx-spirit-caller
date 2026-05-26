; func_01ff8400 — brief 219: ITCM word-fill loop. Same shape as
; main:func_0200093c (paired stub).

        .text
        .global func_01ff8400
        .arm

func_01ff8400:
        add     ip, r1, r2
.L_01ff8404:
        cmp     r1, ip
        stmltia r1!, {r0}
        blt     .L_01ff8404
        bx      lr
