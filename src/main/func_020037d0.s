; func_020037d0 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02102c7c
        .extern func_02001f18
        .global func_020037d0
        .arm
func_020037d0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr ip, [sp, #0x1c]
    sub ip, ip, #0x8
    cmp ip, #0x8
    addls pc, pc, ip, lsl #0x2
    b .L_02003888
.L_020037ec: ; jump table
    b .L_02003810 ; case 0
    b .L_02003888 ; case 1
    b .L_02003828 ; case 2
    b .L_02003888 ; case 3
    b .L_02003840 ; case 4
    b .L_02003888 ; case 5
    b .L_02003858 ; case 6
    b .L_02003888 ; case 7
    b .L_02003870 ; case 8
.L_02003810:
    ldr lr, .L_020038bc
    mov ip, #0x20
    ldr lr, [lr, #0x88]
    mov r4, #0x4
    add r5, lr, #0x80
    b .L_02003890
.L_02003828:
    ldr lr, .L_020038bc
    mov ip, #0x32
    ldr lr, [lr, #0x90]
    mov r4, #0x5
    add r5, lr, #0x80
    b .L_02003890
.L_02003840:
    ldr lr, .L_020038bc
    mov ip, #0x48
    ldr lr, [lr, #0x98]
    mov r4, #0x6
    add r5, lr, #0x80
    b .L_02003890
.L_02003858:
    ldr lr, .L_020038bc
    mov ip, #0x62
    ldr lr, [lr, #0xa0]
    mov r4, #0x7
    add r5, lr, #0x80
    b .L_02003890
.L_02003870:
    ldr lr, .L_020038bc
    mov ip, #0x80
    ldr lr, [lr, #0xa8]
    mov r4, #0x8
    add r5, lr, #0x80
    b .L_02003890
.L_02003888:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_02003890:
    ldr lr, [r0, #0x0]
    mla r0, ip, r1, r5
    str lr, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r1, r3
    ldr r2, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    str r4, [sp, #0x8]
    bl func_02001f18
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_020038bc:
        .word   data_02102c7c
