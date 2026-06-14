; func_ov011_021d1f04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201397c
        .global func_ov011_021d1f04
        .arm
func_ov011_021d1f04:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r4, #0x12
    bgt .L_1ec
    beq .L_254
    b .L_25c
.L_1ec:
    sub r0, r4, #0x2b
    cmp r0, #0x15
    addls pc, pc, r0, lsl #0x2
    b .L_25c
    b .L_254
    b .L_254
    b .L_254
    b .L_254
    b .L_254
    b .L_254
    b .L_25c
    b .L_25c
    b .L_25c
    b .L_25c
    b .L_254
    b .L_25c
    b .L_25c
    b .L_25c
    b .L_25c
    b .L_254
    b .L_254
    b .L_254
    b .L_254
    b .L_254
    b .L_254
    b .L_254
.L_254:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_25c:
    mov r0, r1
    bl func_0201397c
    add r0, r4, r0
    ldmia sp!, {r4, pc}
