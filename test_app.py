# test_app.py
from app import sumar

def test_sumar():
    """
    Prueba la función 'sumar' de app.py
    """
    assert sumar(2, 3) == 5
    assert sumar(-1, 1) == 0
    assert sumar(10, -5) == 5