; func_ov002_021bbd54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ba104
        .extern func_ov002_021bd710
        .global func_ov002_021bbd54
        .arm
func_ov002_021bbd54:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, #0x0
    mov r7, r0
    mov r6, r1
    mov r4, r5
.L_14:
    mov r0, r7
    mov r1, r4
    mov r2, r6
    bl func_ov002_021ba104
    cmp r0, #0x0
    beq .L_40
    mov r0, r7
    mov r1, r4
    bl func_ov002_021bd710
    cmp r0, #0x0
    addeq r5, r5, #0x1
.L_40:
    add r4, r4, #0x1
    cmp r4, #0xa
    ble .L_14
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
