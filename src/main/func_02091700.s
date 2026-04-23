; func_02091700: init-then-loop idle-task entry.
;
; Disassembly (build/eur/asm/_dsd_gap@main_*.s):
;
;     stmdb sp!, {lr}
;     sub   sp, sp, #0x4             ; reserve a 4-byte stack slot
;                                    ; (unreferenced — probably housed
;                                    ;  a variable the compiler later
;                                    ;  optimised away, but the frame
;                                    ;  size survived into codegen)
;     bl    func_02093790            ; one-shot init
;   .L_02091710:
;     bl    func_02093bf0            ; loop body (per-iteration work)
;     b     .L_02091710              ; unconditional loop — encoded as
;                                    ; b #-0x4 (target = next insn - 4)
;
; 5 ARM instructions, 0x14 bytes.
;
; Why `.s`, not plain C: the natural C form
;
;     void func_02091700(void) {
;         func_02093790();
;         while (1) { func_02093bf0(); }
;     }
;
; compiles under mwcc -O4,p to a frame without the `sub sp, sp, #0x4`
; (no locals = no stack reservation), producing 0x10 bytes instead of
; 0x14. The unused 4-byte slot in baserom suggests the original source
; had a local variable that was later eliminated by a readability-
; preserving refactor — the frame layout is a fossil. No combination
; of C source I could coax into mwcc produces the specific 0x14-byte
; prologue.
;
; Shipping as standalone `.s` per the src/main/Div.s precedent (and
; brief 013's one-.s-per-TU constraint). The `b` with a literal
; pseudo-offset operand matches the dsd disassembly verbatim.
;
; Semantically: an infinite idle/task loop that does some init once,
; then hangs forever calling a per-tick worker. Consistent with the
; ARM9's main-thread idle-loop pattern on early DS software — the
; NDS ARM9 main-loop stays in a similar shape until OS/task switch.

        .text

        .extern func_02093790
        .extern func_02093bf0

        .global func_02091700
        .arm
func_02091700:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x4
        bl      func_02093790
loop_top:
        bl      func_02093bf0
        b       loop_top
