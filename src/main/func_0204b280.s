; func_0204b280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204918c
        .extern func_020498f0
        .global func_0204b280
        .arm
func_0204b280:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_020498f0
    ldr r0, [r0, #0x2fc]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    mov r4, #0x0
    bl func_020498f0
    ldr r0, [r0, #0x344]
    cmp r0, #0x0
    ble .L_224
.L_1e8:
    bl func_020498f0
    add r0, r0, r4
    ldrb r0, [r0, #0x304]
    bl func_0204918c
    cmp r0, #0x0
    ble .L_210
    cmp r0, r5
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
.L_210:
    add r4, r4, #0x1
    bl func_020498f0
    ldr r0, [r0, #0x344]
    cmp r4, r0
    blt .L_1e8
.L_224:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
