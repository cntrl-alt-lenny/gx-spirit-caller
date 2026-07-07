; func_ov002_021df848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021d46ac
        .extern func_ov002_02244efc
        .extern func_ov002_02256208
        .global func_ov002_021df848
        .arm
func_ov002_021df848:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    movs r5, r1
    mov r6, r0
    mov r4, r3
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    cmp r2, #0x0
    beq .L_44
    ldr r2, _LIT0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
.L_44:
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r2, _LIT2
    mov r0, r6
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r1, _LIT3
    mov r0, r6
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r0, _LIT4
    mov r2, r4, lsl #0x10
    cmp r5, r0
    movgt r5, r0
    cmp r6, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x25
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021d46ac
    ldr r0, _LIT5
    cmp r4, r0
    beq .L_f4
    mov r0, r6
    bl func_ov002_02256208
.L_f4:
    ldr r1, [sp]
    mov r0, #0x10000
    bic r2, r1, #0x10000
    mov r1, r6, lsl #0x1f
    orr r1, r2, r1, lsr #0xf
    rsb r0, r0, #0x0
    and r1, r1, r0
    mov r0, r5, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    mov r0, #0x10
    str r1, [sp]
    bl func_ov002_02244efc
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00001805
_LIT1: .word 0x00001850
_LIT2: .word 0x00001a06
_LIT3: .word 0x000018c4
_LIT4: .word 0x0000ffff
_LIT5: .word 0x0000159b
