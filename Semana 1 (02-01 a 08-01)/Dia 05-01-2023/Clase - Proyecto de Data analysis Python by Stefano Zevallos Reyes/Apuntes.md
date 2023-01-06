Resumen: Setefano en esta clase lo que hace es importar un dataset que se encuentra en un archivo .txt, este dataset es en formato JSON. una vez que importa el dataset lo mete a una lista para despes convertir en un dataframe y poder manipular la informacion de forma mas sencilla. Despues de tener el dataframe agrupa las localizaciones con una agrupaciones de las personas que usan windows y las que no. Al final muestra graficamente la informacion del numero de personas y el procentaje de personas que utilizan windows y las que no en ciertas localización

Pasos que hace:
* Importa las librerias pandas, numpy, json y  
```python
import numpy as np
import pandas as pd
import json
```

* Guarda la dirección del archivo en un variable tipo string
```python
path = "direccion/del/archvio.txt"
```

* Con una list comprehension guarda los datos, esto lo hace leyendo linea por linea el archivo.txt
```python
records = [json.load(line) for line in open(archivo.txt)]
```

* Con otra list comprehension guarda la columna de "tz"
```python
time_zones = [rec['tz'] for rec in records if 'tz' in rec]
```

* Crear un dataframe con la lista ``records`` 
```python
frame  =  pd.DataFrame(records)
```

* Cuenta los valores repetidos de las localizaciones para saber cuantos registros hay de cada lugar y los guarda en ``tz_counts``
```python
tz_counts = frame['tz'].value_counts()
```

* Sustituye los valores ``NaN`` o `None` con una la palabra ``Missing`` de **tz** 
```Python
clean_tz = frame['tz'].fillna('missing')
```

* Sustituye los valores " " de `clean_tz` por `unknown`
```Python
clean_tz[clean_tz['tz']==''] = 'unknown' 
```

* Reescribe la variable `tz_counts` ahora con los datos limpios
```Python
tz_counts = clean_tz.value_counts()
```

* Importa libreria de visualización
```Python
import seaborn as sns
```

* Separa una pequeña muestra de la data
```Python
subset = tz_counts[:10]
```

* Grafica los datos de la muestra
```Python
sns.barplot(y=subset.index, x=subset.values)
```

* Extrae la primera cadena de texto quitanto las los valores `NaN` y agarrando la primera primera palabra del texto de la columna `a` y lo pone en una Serie que con  `pd.Series()`
```Python
results = pd.Series([x.split()[0] for x in frame.a.dropna()])
```

* Muestra los primeros 8 registros con mayor sumatoria de la aplicación que las personas utilizaron como navegador
```Python
results.value_counts()[:8]
```

* Quita los valores nulos en la columna `a` del datarame `frame`
```Python
cframe = frame[frame.a.notnull()]
```

* Agrega una nueva columna `os` colocando `windows` o `no windows`. Esto lo hace si es que en el registro de la columna `a` contiene la palabra `windos`.
```Python
cframe['os'] = np.where(cframe['a'].str.contains('windows'), 'windows', 'Not windows')
```

* Agrupa las columnas `tz` y `os` || La función groupby se debe guardar en un lugar 
```Python
by_tz_os = cframe.groupby(['tz','os'])
```

* Cuenta los registros por `tz` los `windows` y `not windows` || La funcions `unstack()` hace que los valores  `windows` y `not windows` se acomoden de manera vertical y usen `tz` como indice || La propiedad `fillna()` es el eje de acomodo, en este caso como es 0 = Eje de los indices.
```Python
agg_counts = by_tz_os.size().unstack().fillna(0)
```

* Extrae los indices de mayor a menor con la funcion `argsort()` || La funcion `sum(1)` hace la sumatoria de los datos por el eje horizontal `tz`
```Python
indexer = agg_counts.sum(1).argsort()
```

* Extrae los registros mas altos con los indices con los numeros mas altos
```Python
count_subset = agg_counts.take(indexer[-10:])
```

* Reordena la data con `stack()` || El formato de `stack()` es lo contrario a `unstack()`
```Python
count_subset = count_subset.stack()
```

* Agrega el nombre a la columna de la cantidad de datos 
```Python
count_subset.name = 'total'
```

* Restea el index para que ahora el indice no sea `tz` y este se haga columna
```Python
count_subst = count_subset.rest_index()
```

* Grafica la data colocoando en "x" el total y en "y" las localizaciones
```Python
sns.barplot(x='total0', y='tz', hue='os', data=count_subset)
```

* Como la grafica presenta un problema de que los datos pequeños no se distinguen, lo que hace ahora es converitr la suma de `windows` y `not windows` en 1. Para eso crea una funcion que crea una nueva columna en el que se agrega el resultado de dividr el valor de `windows` o `not windows` entre la suma de ambos
```Python
def norm_total(group):
	group['normed_total'] = group.total / group.total.sum()
	return gruop
```

Agrupa por `tz` y aplica la funcion `norm_total`
```Python
results = count_subset.groupby('tz').apply(norm_total)
```

* Grafica en "x" los porcentajes y  "y" = "tz"
```Python
sns.barplot(x="normed_total", y='tz’, hue='os', data=results)
```

* Hace un recuentos de los graficos
	* Grafico 1
	```Python
	sns.barplot(y=subset.index, x=subset.values)

	```
	* Grafico 2
	```Python
	sns.barplot(x='total', y='tz', hue='os', data=count_subset)

	```
	* Grafica 3
	```Python
	sns.barplot(x="normed_total", y='tz', hue='os', data=results)

	```

La interpretación que se hace es: 
#1--> De Los datos , 1200 personas son de New York.

#2--> En América/New York 900 persona utilizan windows , y 300 personas no utilizan windows.

#3--> En América §ao_ Paulo el 40% de personas no utiliza windows y el 60% si utiliza windows.
	