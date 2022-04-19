tool
extends MeshInstance

var vertices = PoolVector3Array()
var indices = PoolIntArray()

var origenX = 0
var origenY = 0
var origenZ = 0

var tam = 1

func _ready():
	cube()
	
func cube():
	var mesh_arrays = []
	var arr_mesh = ArrayMesh.new()
	self.mesh = CubeMesh.new()
	
	mesh_arrays.resize(ArrayMesh.ARRAY_MAX)
	
	addVertex(origenX, origenY, origenZ)
	addIndex()
	
	mesh_arrays[Mesh.ARRAY_VERTEX] = vertices
	mesh_arrays[Mesh.ARRAY_INDEX] = indices
	print(mesh_arrays)
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, mesh_arrays)
	self.mesh = arr_mesh

func addVertex(x,y,z):
	vertices.append_array([Vector3(x,y,z), Vector3(x,y+tam,z), Vector3(x,y+tam,z+tam), Vector3(x,y,z+tam)])
	vertices.append_array([Vector3(x+tam,y,z+tam), Vector3(x+tam,y+tam,z+tam), Vector3(x+tam,y+tam,z), Vector3(x+tam,y,z)])
	
func addIndex():
	indices.append_array([0,1,2,0,2,3]) #Cara frontal
	indices.append_array([4,5,6,4,6,7]) #Cara trasera
	indices.append_array([0,6,1,0,7,6]) #Cara izquierda
	indices.append_array([1,6,5,1,5,2]) #Cara superior
	indices.append_array([7,0,3,7,3,4]) #Cara inferior
	indices.append_array([2,5,4,2,4,3]) #Cara derecha
	
