; func_ov017_021b680c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_02105989
        .extern data_02105a4d
        .extern data_ov017_021b8228
        .extern data_ov017_021b8238
        .extern data_ov017_021b8254
        .extern data_ov017_021b8270
        .extern data_ov017_021b8290
        .extern data_ov017_021b82b0
        .extern data_ov017_021b82d0
        .extern data_ov017_021b82f0
        .extern data_ov017_021b8310
        .extern data_ov017_021b8330
        .extern data_ov017_021b8350
        .extern data_ov017_021b877c
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02005088
        .extern func_020054a4
        .extern func_02005800
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0201e7e0
        .extern func_0201ef90
        .extern func_0202c0c0
        .extern func_0208df0c
        .extern func_0208df60
        .extern func_0208e1cc
        .extern func_0208e220
        .extern func_02091554
        .extern func_02093820
        .extern func_02094550
        .extern func_ov017_021b6774
        .extern func_ov017_021b73a8
        .extern func_ov017_021b7490
        .extern func_ov017_021b7578
        .extern func_ov017_021b768c
        .global func_ov017_021b680c
        .arm
func_ov017_021b680c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x60
    mov r4, r0
    ldr r0, .L_021b6ed4
    mov r1, #0x8
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, .L_021b6ed8
    bl func_0202c0c0
    mov r6, r0
    bl func_0208df60
    mov r3, #0x2
    add r2, r0, #0x2580
    str r3, [sp, #0x0]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, .L_021b6ed4
    mov r1, r6
    bl func_02005088
    mov r6, #0x12c
    bl func_0208e220
    mov ip, #0x0
    add r9, r0, #0x28
    mov r3, ip
.L_021b686c:
    mov r10, r3
.L_021b6870:
    add r0, r6, #0x1
    mov r1, r10, lsl #0x1
    orr r2, r6, #0x2000
    mov r0, r0, lsl #0x10
    add r10, r10, #0x1
    strh r2, [r9, r1]
    cmp r10, #0x8
    mov r6, r0, lsr #0x10
    blt .L_021b6870
    add ip, ip, #0x1
    cmp ip, #0x2
    add r9, r9, #0x40
    blt .L_021b686c
    ldr r2, .L_021b6edc
    add r0, sp, #0x18
    mov r1, #0x0
    bl func_02001bc8
    ldr r1, .L_021b6ee0
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_02094550
    add r0, sp, #0x38
    bl func_0201d47c
    ldr r0, .L_021b6ee4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x38]
    mov r0, #0x6c00
    ldrh r1, [sp, #0x4c]
    str r0, [sp, #0x44]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x4c]
    mov r0, #0x200
    ldrh r1, [sp, #0x4c]
    strh r0, [sp, #0x48]
    orr r0, r1, #0x10
    ldr r1, [sp, #0x50]
    strh r0, [sp, #0x4c]
    bic r1, r1, #0x1c000
    orr r1, r1, #0x8000
    bic r1, r1, #0x7f
    orr r1, r1, #0xd
    bic r1, r1, #0x3f80
    orr r1, r1, #0x180
    add r0, sp, #0x38
    str r1, [sp, #0x50]
    bl func_0201e5b8
    ldr r1, [sp, #0x50]
    ldrh r2, [sp, #0x4e]
    bic r1, r1, #0x1c000
    orr r1, r1, #0x1c000
    bic r1, r1, #0x3f80
    orr r1, r1, #0x400
    orr r2, r2, #0x8000
    add r0, sp, #0x38
    str r1, [sp, #0x50]
    strh r2, [sp, #0x4e]
    bl func_0201e5b8
    ldr r1, [sp, #0x50]
    add r0, sp, #0x38
    bic r1, r1, #0x3f80
    orr r1, r1, #0x680
    str r1, [sp, #0x50]
    bl func_0201e5b8
    ldr r0, [sp, #0x38]
    bl Task_Invoke
    mov r6, #0x0
.L_021b6984:
    cmp r6, #0x0
    beq .L_021b69a8
    cmp r6, #0x1
    beq .L_021b69b8
    cmp r6, #0x2
    ldreq r7, .L_021b6ee8
    moveq r8, #0xc
    moveq r5, #0x1a
    b .L_021b69c4
.L_021b69a8:
    mov r7, #0x6f
    mov r8, #0xa
    mov r5, #0x2
    b .L_021b69c4
.L_021b69b8:
    ldr r7, .L_021b6eec
    mov r8, #0xb
    mov r5, #0xe
.L_021b69c4:
    bl func_0208e1cc
    add r9, r0, r7, lsl #0x1
    ldr r0, .L_021b6ed4
    mov r1, #0x6
    mov r2, #0x2
    bl func_02001d0c
    add r0, r8, #0xc2
    add r0, r0, #0x600
    bl func_0202c0c0
    mov r10, r0
    bl func_0208df0c
    add r2, r0, r5, lsl #0x5
    mov r0, #0x3
    str r0, [sp, #0x0]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, .L_021b6ed4
    mov r1, r10
    mov r3, #0x2
    bl func_02005088
    mov r1, #0x0
    mov r10, r5
    mov lr, r1
.L_021b6a20:
    mov r0, lr
.L_021b6a24:
    add r2, r10, #0x1
    mov r3, r0, lsl #0x1
    orr ip, r10, #0x1000
    mov r2, r2, lsl #0x10
    add r0, r0, #0x1
    strh ip, [r9, r3]
    cmp r0, #0x6
    mov r10, r2, lsr #0x10
    blt .L_021b6a24
    add r1, r1, #0x1
    cmp r1, #0x2
    add r9, r9, #0x40
    blt .L_021b6a20
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_021b6984
    ldr r0, .L_021b6ef0
    mov r1, #0x5000000
    mov r2, #0x20
    bl func_02094550
    ldr r0, .L_021b6ef0
    ldr r1, .L_021b6ef4
    mov r2, #0x20
    bl func_02094550
    ldr r1, .L_021b6ef8
    add r0, sp, #0x18
    mov r2, #0x0
    bl func_02001bc8
    ldr r1, .L_021b6efc
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_02094550
    bl func_0208e1cc
    add r5, r0, #0x160
    ldr r0, .L_021b6f00
    ldrb r0, [r0, #0xa3c]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, .L_021b6ed4
    mov r1, #0x10
    mov r2, #0x2
    bl func_02001d0c
    bl func_0208df0c
    add r2, r0, #0x4c0
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, .L_021b6ed4
    ldr r1, .L_021b6f04
    mov r3, #0x2
    bl func_02005088
    mov r7, #0x0
    mov r3, #0x26
    mov r2, r7
.L_021b6b04:
    mov r6, r2
.L_021b6b08:
    add r0, r3, #0x1
    mov r1, r6, lsl #0x1
    add r6, r6, #0x1
    mov r0, r0, lsl #0x10
    strh r3, [r5, r1]
    cmp r6, #0x10
    mov r3, r0, lsr #0x10
    blt .L_021b6b08
    add r7, r7, #0x1
    cmp r7, #0x2
    add r5, r5, #0x40
    blt .L_021b6b04
    mov r5, #0x0
    bl func_0208e1cc
    add r0, r0, #0x9a
    ldr r1, .L_021b6f00
    add r6, r0, #0x200
    ldrb r0, [r1, #0xb00]
    bl func_02001d68
    ldr r0, .L_021b6ed4
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, .L_021b6f08
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0x90
    cmp r0, #0x14
    addge r5, r5, #0x14
    addlt r5, r5, r0
    bl func_0208df0c
    mov r3, r0
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r7, #0xc
    add r2, r3, #0x8c0
    ldr r0, .L_021b6ed4
    ldr r1, .L_021b6f08
    add r3, r5, #0x6
    str r7, [sp, #0x4]
    bl func_02005088
    mov r7, #0x0
    mov r3, #0x46
    mov r2, r7
.L_021b6bb8:
    mov r5, r2
.L_021b6bbc:
    add r0, r3, #0x1
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    strh r3, [r6, r1]
    cmp r5, #0x14
    mov r3, r0, lsr #0x10
    blt .L_021b6bbc
    add r7, r7, #0x1
    cmp r7, #0x2
    add r6, r6, #0x40
    blt .L_021b6bb8
    add r0, sp, #0x38
    bl func_0201d47c
    ldr r0, .L_021b6f0c
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x4c]
    mov r6, #0x40
    ldr r1, [sp, #0x50]
    bic r2, r2, #0xf
    orr r2, r2, #0x2
    strh r2, [sp, #0x4c]
    ldrh r2, [sp, #0x4c]
    str r0, [sp, #0x38]
    bic r0, r1, #0x1c000
    orr r5, r2, #0x10
    orr r3, r0, #0x8000
    sub r1, r6, #0x41
    mov r2, #0x400
    add r0, sp, #0x38
    str r6, [sp, #0x44]
    strh r5, [sp, #0x4c]
    str r3, [sp, #0x50]
    strh r2, [sp, #0x48]
    str r1, [sp, #0x40]
    bl func_0201e5b8
    ldr r0, [sp, #0x38]
    bl Task_Invoke
    ldr r1, .L_021b6f00
    ldr r0, .L_021b6f10
    ldr r7, [r1, #0xa64]
    mov r6, #0x0
    str r6, [r0, #0x8]
    str r6, [r0, #0x4]
    str r6, [r0, #0x0]
    and r5, r7, #0x3e0
    and r6, r7, #0x1f
    and r3, r7, #0x7c00
    and r2, r7, #0xf8000
    and r1, r7, #0x7e000000
    strb r6, [r4, #0x1cc]
    mov r5, r5, lsr #0x5
    strb r5, [r4, #0x1cd]
    mov r3, r3, lsr #0xa
    strb r3, [r4, #0x1ce]
    mov r2, r2, lsr #0xf
    and r0, r7, #0x1f00000
    strb r2, [r4, #0x1cf]
    mov r1, r1, lsr #0x19
    str r1, [r4, #0x1d4]
    mov r1, r0, lsr #0x14
    add r0, r4, #0x100
    strh r1, [r0, #0xd0]
    bl func_0208e1cc
    ldr r1, .L_021b6f00
    add r0, r0, #0xda
    ldr r1, [r1, #0x4]
    add r5, r0, #0x300
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r0, r4
    bl func_ov017_021b768c
    mov r7, #0x0
    mov r3, #0x6e
    mov r2, r7
.L_021b6cf4:
    mov r6, r2
.L_021b6cf8:
    add r0, r3, #0x1
    mov r1, r6, lsl #0x1
    add r6, r6, #0x1
    mov r0, r0, lsl #0x10
    strh r3, [r5, r1]
    cmp r6, #0x14
    mov r3, r0, lsr #0x10
    blt .L_021b6cf8
    add r7, r7, #0x1
    cmp r7, #0x2
    add r5, r5, #0x40
    blt .L_021b6cf4
    ldr r0, .L_021b6f14
    ldrb r2, [r4, #0x1cc]
    ldr r0, [r0, #0x0]
    ldr r1, .L_021b6f18
    bl func_02091554
    ldr r0, .L_021b6f14
    ldrb r2, [r4, #0x1cc]
    ldr r0, [r0, #0x4]
    ldr r1, .L_021b6f1c
    bl func_02091554
    ldr r0, .L_021b6f14
    ldrb r2, [r4, #0x1cc]
    ldr r0, [r0, #0x8]
    ldr r1, .L_021b6f20
    bl func_02091554
    ldr r0, .L_021b6f14
    ldr r1, .L_021b6f24
    ldr r0, [r0, #0xc]
    ldrb r2, [r4, #0x1cc]
    bl func_02091554
    bl func_0201e7e0
    bl func_02093820
    mov r3, #0x0
    str r3, [sp, #0x0]
    mov r2, #0x1
    str r2, [sp, #0x4]
    ldr r1, .L_021b6f28
    mov r0, #0x200
    str r1, [sp, #0x8]
    str r2, [sp, #0xc]
    str r0, [sp, #0x10]
    add r0, r4, #0x54
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, r4, #0x4
    add r2, r4, #0x8
    bl func_0201ef90
    ldr r0, .L_021b6f14
    ldr r1, .L_021b6f2c
    ldr r0, [r0, #0x0]
    ldrb r2, [r4, #0x1cd]
    bl func_02091554
    ldr r0, .L_021b6f14
    ldr r1, .L_021b6f30
    ldr r0, [r0, #0x4]
    ldrb r2, [r4, #0x1cd]
    bl func_02091554
    ldr r0, .L_021b6f14
    ldr r1, .L_021b6f34
    ldr r0, [r0, #0x8]
    ldrb r2, [r4, #0x1cd]
    bl func_02091554
    ldr r0, .L_021b6f14
    ldr r1, .L_021b6f38
    ldr r0, [r0, #0xc]
    ldrb r2, [r4, #0x1cd]
    bl func_02091554
    bl func_0201e7e0
    bl func_02093820
    mov r3, #0x200
    str r3, [sp, #0x0]
    mov r2, #0x1
    str r2, [sp, #0x4]
    ldr r1, .L_021b6f28
    add r0, r4, #0xb0
    str r1, [sp, #0x8]
    str r2, [sp, #0xc]
    str r3, [sp, #0x10]
    str r0, [sp, #0x14]
    add r0, r4, #0x5c
    add r1, r4, #0x60
    add r2, r4, #0x64
    mov r3, #0x6000
    bl func_0201ef90
    ldr r1, .L_021b6f28
    mov r0, r4
    bl func_ov017_021b73a8
    ldr r1, .L_021b6f28
    mov r0, r4
    bl func_ov017_021b7490
    ldr r1, .L_021b6f28
    mov r0, r4
    bl func_ov017_021b7578
    mov r1, #0x50
    str r1, [r4, #0x1e4]
    str r1, [r4, #0x1dc]
    mov r1, #0x60
    mov r0, #0x18
    str r1, [r4, #0x1e0]
    str r0, [r4, #0x1f4]
    str r0, [r4, #0x1ec]
    mov r0, #0x40
    str r0, [r4, #0x1f0]
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x17
    orr r1, r1, r0, lsl #0x8
    ldr r0, .L_021b6f3c
    str r1, [r2, #0x0]
    bl func_02005800
    mov r0, #0x1
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_021b6ed4:
        .word   data_02102c90
.L_021b6ed8:
        .word   0x6c3
.L_021b6edc:
        .word   0x7fff
.L_021b6ee0:
        .word   0x5000040
.L_021b6ee4:
        .word   data_ov017_021b8238
.L_021b6ee8:
        .word   0x1af
.L_021b6eec:
        .word   0x10f
.L_021b6ef0:
        .word   data_020b4728
.L_021b6ef4:
        .word   0x5000060
.L_021b6ef8:
        .word   0x3ff
.L_021b6efc:
        .word   0x5000020
.L_021b6f00:
        .word   data_02104f4c
.L_021b6f04:
        .word   data_02105989
.L_021b6f08:
        .word   data_02105a4d
.L_021b6f0c:
        .word   data_ov017_021b8254
.L_021b6f10:
        .word   data_ov017_021b877c
.L_021b6f14:
        .word   data_ov017_021b8228
.L_021b6f18:
        .word   data_ov017_021b8270
.L_021b6f1c:
        .word   data_ov017_021b8290
.L_021b6f20:
        .word   data_ov017_021b82b0
.L_021b6f24:
        .word   data_ov017_021b82d0
.L_021b6f28:
        .word   data_ov017_021b8228
.L_021b6f2c:
        .word   data_ov017_021b82f0
.L_021b6f30:
        .word   data_ov017_021b8310
.L_021b6f34:
        .word   data_ov017_021b8330
.L_021b6f38:
        .word   data_ov017_021b8350
.L_021b6f3c:
        .word   func_ov017_021b6774
