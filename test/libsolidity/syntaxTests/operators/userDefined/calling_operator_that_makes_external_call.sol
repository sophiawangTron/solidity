type Int is int16;
using {add as +, unsub as -} for Int global;

IAdder constant ADDER = IAdder(address(0));

function add(Int x, Int y) pure returns (Int) {
    return ADDER.mul(x, y);
}

function unsub(Int x) pure returns (Int) {
    return ADDER.inc(x);
}

interface IAdder {
    function mul(Int, Int) external returns (Int);
    function inc(Int) external returns (Int);
}
// ----
// TypeError 8961: (169-184): Function cannot be declared as pure because this expression (potentially) modifies the state.
// TypeError 8961: (243-255): Function cannot be declared as pure because this expression (potentially) modifies the state.
