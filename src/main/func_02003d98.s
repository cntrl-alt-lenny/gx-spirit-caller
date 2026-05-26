; func_02003d98 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02102c7c
        .extern func_020028b8
        .global func_02003d98
        .arm
func_02003d98:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r4, [sp, #0x24]
    mov r5, #0x0
    sub r4, r4, #0x8
    cmp r4, #0x8
    addls pc, pc, r4, lsl #0x2
    b .L_02003e50
.L_02003db8: ; jump table
    b .L_02003ddc ; case 0
    b .L_02003e50 ; case 1
    b .L_02003df4 ; case 2
    b .L_02003e50 ; case 3
    b .L_02003e0c ; case 4
    b .L_02003e50 ; case 5
    b .L_02003e24 ; case 6
    b .L_02003e50 ; case 7
    b .L_02003e3c ; case 8
.L_02003ddc:
    ldr r4, .L_02003e94
    mov ip, #0x20
    ldr r4, [r4, #0x88]
    mov lr, #0x4
    add r5, r4, #0x80
    b .L_02003e50
.L_02003df4:
    ldr r4, .L_02003e94
    mov ip, #0x32
    ldr r4, [r4, #0x90]
    mov lr, #0x5
    add r5, r4, #0x80
    b .L_02003e50
.L_02003e0c:
    ldr r4, .L_02003e94
    mov ip, #0x48
    ldr r4, [r4, #0x98]
    mov lr, #0x6
    add r5, r4, #0x80
    b .L_02003e50
.L_02003e24:
    ldr r4, .L_02003e94
    mov ip, #0x62
    ldr r4, [r4, #0xa0]
    mov lr, #0x7
    add r5, r4, #0x80
    b .L_02003e50
.L_02003e3c:
    ldr r4, .L_02003e94
    mov ip, #0x80
    ldr r4, [r4, #0xa8]
    mov lr, #0x8
    add r5, r4, #0x80
.L_02003e50:
    cmp r5, #0x0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r4, .L_02003e94
    ldr r4, [r4, #0x8]
    str r4, [sp, #0x0]
    ldr r4, [r0, #0x0]
    mla r0, ip, r1, r5
    str r4, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r1, r3
    ldr r2, [sp, #0x20]
    ldr r3, [sp, #0x24]
    str lr, [sp, #0xc]
    bl func_020028b8
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02003e94:
        .word   data_02102c7c
