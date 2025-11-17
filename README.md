# Ciclo de CI/CD para una Aplicación Flask con GitHub Actions y Docker

Este proyecto implementa una aplicación web **Flask** simple con una API y un flujo de **Integración Continua / Despliegue Continuo (CI/CD)** automatizado usando **GitHub Actions** y **Docker**.

El objetivo es asegurar que cada cambio en la rama principal (`maldonado_alejandro`) pase por pruebas exhaustivas antes de construir y publicar el artefacto final (una imagen Docker).

---

## 1. Fases del Pipeline (Archivo `ci.yml`)

El pipeline se activa automáticamente ante cualquier `push` a la rama `maldonado_alejandro`. Consta de dos jobs principales que deben ejecutarse de forma secuencial y exitosa:

### Job 1: Build and Test (Integración Continua)

Este job se ejecuta en un entorno `ubuntu-latest` y está enfocado en verificar la calidad y el correcto funcionamiento del código.

| Paso | Descripción | Archivos involucrados |
| :--- | :--- | :--- |
| **Configurar Python** | Se establece el entorno con Python **3.10**. | N/A |
| **Instalar dependencias** | Se instalan las bibliotecas necesarias listadas en `requirements.txt` (incluyendo `Flask` y `pytest`). | `requirements.txt` |
| **Ejecutar tests** | Se lanza **Pytest** para ejecutar las pruebas unitarias definidas. | `test_app.py` |

#### Ejemplo de Pruebas Unitarias

La prueba unitaria verifica la función `sumar(a, b)` de `app.py`. Si cualquiera de estas aserciones falla, el pipeline se detiene y la construcción del package no procede.

```python
# Contenido de test_app.py
from app import sumar

def test_sumar():
    """
    Prueba la función 'sumar' de app.py
    """
    assert sumar(2, 3) == 5
    assert sumar(-1, 1) == 0
    assert sumar(10, -5) == 5