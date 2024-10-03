import matplotlib.pyplot as plt
import networkx as nx
import math

G = nx.Graph()

entities = [
    ("Заемщик", "square"), 
    ("Поручитель", "square"), 
    ("Кредит", "square"), 
    ("Документы", "square"), 
    ("Автомобиль", "square"), 
    ("Кредитная программа", "square"), 
    ("Платеж", "square"), 
    ("График погашения", "square"), 
    ("Черный список", "square")
]

attributes = [
    ("Имя", "Заемщик"), ("Адрес", "Заемщик"), ("Доход", "Заемщик"), ("Телефон", "Заемщик"),
    ("Имя", "Поручитель"), ("Адрес", "Поручитель"), ("Телефон", "Поручитель"),
    ("Сумма кредита", "Кредит"), ("Процентная ставка", "Кредит"), ("Срок кредита", "Кредит"), 
    ("Дата начала", "Кредит"), ("Дата окончания", "Кредит"), ("Статус кредита", "Кредит"),
    ("Тип документа", "Документы"), ("Номер документа", "Документы"), ("Дата выдачи", "Документы"),
    ("Модель", "Автомобиль"), ("Год выпуска", "Автомобиль"), ("Стоимость", "Автомобиль"), 
    ("VIN", "Автомобиль"), ("Страховой полис", "Автомобиль"),
    ("Процентная ставка", "Кредитная программа"), ("Условия программы", "Кредитная программа"), ("Описание", "Кредитная программа"),
    ("Сумма платежа", "Платеж"), ("Дата платежа", "Платеж"), ("Статус платежа", "Платеж"),
    ("Месяц", "График погашения"), ("Сумма", "График погашения"),
    ("Дата добавления", "Черный список")
]

relations = [
    ("Заемщик", "Кредит"), ("Кредит", "Документы"), ("Кредит", "Автомобиль"), 
    ("Кредит", "Кредитная программа"), ("Кредит", "Платеж"), ("Кредит", "График погашения"), 
    ("Заемщик", "Черный список"), ("Поручитель", "Заемщик")
]

for entity, shape in entities:
    G.add_node(entity, shape=shape)

for attr, entity in attributes:
    G.add_node(attr, shape="circle")
    G.add_edge(attr, entity)

for entity1, entity2 in relations:
    G.add_node(f"{entity1}-{entity2}", shape="diamond")
    G.add_edge(f"{entity1}-{entity2}", entity1)
    G.add_edge(f"{entity1}-{entity2}", entity2)

pos = nx.spring_layout(G, k=1.5, seed=42)  

entity_positions = {entity: pos[entity] for entity, _ in entities}

for entity, _ in entities:
    x, y = entity_positions[entity]
    
    entity_attrs = [attr for attr, ent in attributes if ent == entity]
    
    angle_step = 2 * math.pi / len(entity_attrs)
    
    for i, attr in enumerate(entity_attrs):
        angle = i * angle_step
        radius = 0.2  
        attr_x = x + radius * math.cos(angle)
        attr_y = y + radius * math.sin(angle)
        pos[attr] = (attr_x, attr_y)

plt.figure(figsize=(20, 12))

node_colors = []
for node, data in G.nodes(data=True):
    if data["shape"] == "square":
        nx.draw_networkx_nodes(G, pos, nodelist=[node], node_color="#87CEEB", node_shape="s", node_size=3000, alpha=0.9)
    elif data["shape"] == "circle":
        nx.draw_networkx_nodes(G, pos, nodelist=[node], node_color="#98FB98", node_shape="o", node_size=2000, alpha=0.9)
    else:
        nx.draw_networkx_nodes(G, pos, nodelist=[node], node_color="#FFD700", node_shape="D", node_size=3000, alpha=0.9)

nx.draw_networkx_edges(G, pos)

nx.draw_networkx_labels(G, pos, font_size=10, font_family="sans-serif", font_color="black")



import matplotlib.patches as mpatches

entity_patch = mpatches.Patch(color="#87CEEB", label='Сущности (Квадрат)')
attribute_patch = mpatches.Patch(color="#98FB98", label='Атрибуты (Круг)')
relation_patch = mpatches.Patch(color="#FFD700", label='Связи (Ромб)')

plt.legend(handles=[entity_patch, attribute_patch, relation_patch], loc="upper right")

plt.title("ER-диаграмма системы автокредитования", size=15)
plt.axis("off")
plt.show()
