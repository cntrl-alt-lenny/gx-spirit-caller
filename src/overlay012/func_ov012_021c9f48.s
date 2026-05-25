; func_ov012_021c9f48 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02104f1c
        .extern data_ov012_021cc6a0
        .extern data_ov012_021cc6dc
        .extern data_ov012_021cc74c
        .extern Fill32
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_0201d5c0
        .extern func_0202adf8
        .extern func_0207deb0
        .extern func_0207e124
        .extern func_0207e370
        .extern func_0208232c
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208cc90
        .extern func_0208cfa4
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208d1e4
        .extern func_0208d6f4
        .extern func_0208d7ac
        .extern func_0208d8c0
        .extern func_0208da2c
        .extern func_0208e5ec
        .extern func_0208e7ac
        .extern func_02094504
        .extern func_ov000_021aae54
        .extern func_ov000_021ab21c
        .extern func_ov000_021ab4bc
        .extern func_ov000_021af4bc
        .global func_ov012_021c9f48
        .arm
func_ov012_021c9f48:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_021ca158
    mov r0, #0x0
    mov r2, #0x510
    bl Fill32
    bl func_0200592c
    ldr r0, .L_021ca15c
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    bl func_ov000_021ab21c
    bl func_0208e7ac
    mov r0, #0x1
    bl func_0208da2c
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x2
    bl func_0208d8c0
    mov r0, #0x20
    bl func_0208d6f4
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c8cc
    mov r0, #0x0
    mov r1, #0x12
    bl func_ov000_021ab4bc
    ldr ip, .L_021ca160
    ldr r0, .L_021ca164
    ldrh r1, [ip, #0x0]
    ldr lr, .L_021ca168
    mov r4, #0x2
    and r1, r1, r0
    strh r1, [ip, #0x0]
    mov r2, r0, lsr #0x11
    ldrh r3, [ip, #0x0]
    mov r0, #0x0
    mov r1, #0x1f
    bic r3, r3, #0x3000
    orr r3, r3, #0x10
    strh r3, [ip, #0x0]
    ldrh r5, [ip, #0x0]
    mov r3, #0x3f
    and r5, r5, lr
    strh r5, [ip, #0x0]
    ldrh lr, [ip, #0x0]
    bic lr, lr, #0x3000
    orr lr, lr, #0x8
    strh lr, [ip, #0x0]
    str r4, [ip, #0x4e0]
    str r0, [sp, #0x0]
    bl func_0208e5ec
    ldr r1, .L_021ca16c
    ldr r0, .L_021ca170
    str r1, [r0, #0x0]
    ldr r1, .L_021ca174
    ldr r0, .L_021ca178
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207deb0
    mov r0, r4
    mov r1, #0x1
    bl func_0207e124
    mov r0, #0x10000
    mov r1, #0x1
    bl func_0207e370
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x100
    bl func_0208cfa4
    mov r0, #0x0
    bl func_0208c8b0
    mov r0, #0x1
    mov r1, #0x11
    bl func_ov000_021ab4bc
    ldr r1, .L_021ca17c
    mov r3, #0x4000000
    ldrh r0, [r1, #0x0]
    ldr r2, .L_021ca180
    add ip, r3, #0x1000
    bic r0, r0, #0x8000
    strh r0, [r1, #0x0]
    ldr r1, [r3, #0x0]
    mov r0, #0x4
    and r1, r1, r2
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3, #0x0]
    ldr r3, [ip, #0x0]
    mov r1, r4
    and r2, r3, r2
    orr r2, r2, #0x10
    orr r2, r2, #0x200000
    str r2, [ip, #0x0]
    bl func_0201d5c0
    mov r0, #0x9
    mov r1, r4
    bl func_0201d5c0
    bl func_ov000_021af4bc
    ldr r0, .L_021ca184
    bl func_0202adf8
    bl func_ov000_021aae54
    mov r0, #0x1
    bl func_02005bfc
    mov r0, r4
    bl func_02005bfc
    bl func_0208232c
    ldr r1, .L_021ca188
    mov r2, #0x0
    ldr r3, [r1, #0x1a8]
    mov r0, #0x1
    bic r3, r3, #0xff
    orr r3, r3, #0xff
    str r3, [r1, #0x1a8]
    str r2, [r1, #0x184]
    str r2, [r1, #0x188]
    ldmia sp!, {r3, r4, r5, pc}
.L_021ca158:
        .word   data_ov012_021cc6dc
.L_021ca15c:
        .word   0x1ff
.L_021ca160:
        .word   0x4000060
.L_021ca164:
        .word   0xffffcffd
.L_021ca168:
        .word   0xcffb
.L_021ca16c:
        .word   0xbfff0000
.L_021ca170:
        .word   0x4000580
.L_021ca174:
        .word   data_02104f1c
.L_021ca178:
        .word   data_ov012_021cc74c
.L_021ca17c:
        .word   0x4000304
.L_021ca180:
        .word   0xffcfffef
.L_021ca184:
        .word   data_ov012_021cc6a0
.L_021ca188:
        .word   data_ov012_021cc6a0
